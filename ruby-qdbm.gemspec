# -*- coding: utf-8 -*-

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ruby-qdbm"
  spec.version       = '0.1.1'
  spec.authors       = ["TOKI Yoshinori"]
  spec.email         = ["toki@freedom.ne.jp"]

  spec.summary       = %q{QDBM ruby extension libraries (depot/curia/villa)}
  spec.description   = <<-'EOF'
    QDBM ruby extension libraries (depot/curia/villa).
    This gem provides QDBM ruby extension libraries (depot/curia/villa).
    The modifications from original are as follows.
    1. The Debian patch is applied for the latest version of ruby.
    2. Repacked to rubygems.
  EOF
  spec.homepage      = "https://github.com/y10k/ruby-qdbm"
  spec.license       = "LGPL-2.1-only"

  spec.extensions    = %w[ ext/depot/extconf.rb ext/curia/extconf.rb ext/villa/extconf.rb ]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
end

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
