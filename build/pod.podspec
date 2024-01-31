Pod::Spec.new do |spec|
  spec.name         = 'Gbenji'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/benjieum/go-benjieum'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS Benjieum Client'
  spec.source       = { :git => 'https://github.com/benjieum/go-benjieum.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Gbenji.framework'

	spec.prepare_command = <<-CMD
    curl https://gbenjistore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Gbenji.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
