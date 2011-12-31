Jekyll::VERSION_TIMESTAMP = Time.now.strftime("%Y%m%d%H%M%S")
Jekyll::VERSIONS = { 
                    'style' => ( ENV['VERSION_style'] || Jekyll::VERSION_TIMESTAMP ), 
                    'plugins' => ( ENV['VERSION_plugins'] || Jekyll::VERSION_TIMESTAMP ), 
                    'script' => ( ENV['VERSION_script'] || Jekyll::VERSION_TIMESTAMP ),
                    'manifest' => ( ( ( ENV['VERSION_style'] && ENV['VERSION_plugins'] && ENV['VERSION_script'] ) ? "#{ENV['VERSION_script']}#{ENV['VERSION_plugins']}#{ENV['VERSION_style']}" : nil ) || Jekyll::VERSION_TIMESTAMP )
                    }
Jekyll::ENV = (ENV['JEKYLL_ENV'] || 'development')