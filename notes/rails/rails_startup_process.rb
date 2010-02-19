### The Rails 2.3.5 initialization process

1. Incoming requests will hit one or another of the files in {railties/dispatches}.
   * dispatch.rb
   * gateway.cgi
   * dispatch.fcgi
   * config.ru (Rack)
   NOTE: details of the process for your particular server are in {railties/lib/commands/servers}

   [Inside the Dispatcher script]
     - Loads {/environment.rb/} file
     - Loads the dispatcher module
     - additional load paths
     - Call Dispatcher.dispatch to handle the request
     
     
  [Inside the environment.rb]
    - Defines RAILS_GEM_VERSION (ignored if vendored Rails, which means that the rails gem is in vendor/ directory)
    - Requires {/boot.rb/}
      [Inside boot.rb]
        - Defines RAILS_ROOT
        - Defines Rails module (this is the first time the Rails constant exists)
        - Rails.boot!
          - Decides if loads VendorRails or GemRails
        
        [Inside initializer.rb]
          - Requires 'logger', 'set' and 'pathname' (part of the Ruby Standard Library)
          - Requires {railties_path} which defines RAILTIES_PATH
          - Bring Rails::Plugin::Locator, Rails::Plugin and Rails::Plugin::Loader
            - At this point, Rails has all to load plugins, but it has not loaded any of them yet.
          - Bring Rails::GemDependency
          - Requires {rails/rack}
            - autoload :Debugger, :LogTailer, :Metal and :Static
          - Defines RAILS_ENV based on ENV['RAILS_ENV'] or "development"
          - Defines Rails::Initializer and Rails::Configuration classes
        
        [Rails::Initializer.rub(:install_gem_spec_stubs)]
          - Make think plugins that the required gems are present no matter if it is not truth
      
    - Executes Rails::Initializer.run do |config|; end
        config = Rails::Configuration.new (defined in initializer.rb)
        - Rails::Initializer.run was called in boot.rb with default configuration
          and this default config is overwritten by the call in environment.rb
    
    - The Configuration object
      It sets default options in the initializer of the Configurator class
        - Loading the proper environment
            load_environment
            environment_path => "#{root_path}/config/environments/#{environment}.rb"
            environment => ::RAILS_ENV
        - Dispatching (The Rails dispatcher is the piece that handles sending incoming HTTP requests to their proper controller for processing)
            - Requires {railties/lib/dispatcher.rb}
            - Dispatcher = ActionController::Dispatcher
            
            [Inside ActionController::Dispatcher]
              - define_dispatcher_callbacks sets up the "reload classes on every request" behavior
              
            initialize_routing => The Dispatcher needs the information from your routes.rb
            load_application_classes => finally loads {app/models}, {app/controllers} and {app/helpers}
            
    - ADDITIONAL_LOAD_PATHS
    - Finally Dispatcher.dispatch
    
    def dispatch(cgi = nil, session_options = CgiRequest::DEFAULT_SESSION_OPTIONS, output = $stdout)
      new(output).dispatch_cgi(cgi, session_options)
    end
    
    This falls through to {dispatch_cgi}, which builds up new request and response objects:
      def dispatch_cgi(cgi, session_options)
        ... CgiRequest.new(cgi, session_options) ...
        dispatch
      end
      
      def dispatch
        dispatch_unlocked
      end
      
      def dispatch_unlocked
        run_callbacks :before_dispatch
        handle_request
        run_callbacks :after_dispatch, :enumerator => :reverse_each
      end
      
      By default, Rails sets up two callbacks in development mode, and none in production or test modes:
        def define_dispatcher_callbacks(cache_classes)
          unless cache_classes
            # Development mode callbacks
            before_dispatch :reload_application
            after_dispatch :cleanup_application
          end
        end
        
        def reload_application
          # Run prepare callbacks before every request in development mode
          run_callbacks :prepare_dispatch

          Routing::Routes.reload
          ActionController::Base.view_paths.reload!
        end
        
        HANDLING THE REQUEST
        
        def handle_request
          @controller = Routing::Routes.recognize(@request) #figure out which controller
          @controller.process(@request, @response).out(@output) #to hand the actual request and response objects to that controller,
        end
        
        :after_dispatch

        on config.cache_classes = false Rails finishes the dispatch process 
        for a single request by calling the Dispatcher#cleanup_application method:

        def cleanup_application
          ActiveRecord::Base.reset_subclasses if defined?(ActiveRecord)
          ActiveSupport::Dependencies.clear
          ActiveRecord::Base.clear_reloadable_connections! if defined?(ActiveRecord)
        end
        
        TADA!!!!!!!!!!!!!!!!
        
         => check config.threadsafe!