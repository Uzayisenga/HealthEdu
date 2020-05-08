module MyEngine

    class Engine < Rails::Engine
  
      initializer "rapidfire.load_app_root" do |app|
  
         MyEngine.app_root = app.root
  
      end
  
    end
  
  end