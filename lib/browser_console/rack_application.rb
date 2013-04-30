module BrowserConsole
  class RackApplication
    def self.call env
      [200,{'Content-Type'=>'application/json'},'{"success": true}']
    end
  end
end