# -*- coding: utf-8 -*-

require "bundler/gem_tasks"
require 'rake/clean'
require 'rake/extensiontask'

Rake::ExtensionTask.new do |task|
  task.name = 'mod_depot'
  task.ext_dir = 'ext/depot'
end

Rake::ExtensionTask.new do |task|
  task.name = 'mod_curia'
  task.ext_dir = 'ext/curia'
end

Rake::ExtensionTask.new do |task|
  task.name = 'mod_villa'
  task.ext_dir = 'ext/villa'
end

desc 'Test'
task :test => [ :rbdptest, :rbcrtest, :rbvltest ]

class QDBMTestTask < Rake::TaskLib
  def initialize(name, *args)
    @name = name
    @args = args
    define
  end

  def define
    desc "#{@name}test"
    task("#{@name}test") { run }
    CLOBBER.include "test/#{@name}casket"
  end
  private :define

  def run
    rm_rf "test/#{@name}casket"
    ruby "test/#{@name}test", 'write', "test/#{@name}casket", *@args
    ruby "test/#{@name}test", 'read', "test/#{@name}casket"
    ruby "test/#{@name}test", 'misc', "test/#{@name}casket"
  end
  private :run
end

QDBMTestTask.new('rbdp', '10000', '1000')
QDBMTestTask.new('rbcr', '10000', '1000', '10')
QDBMTestTask.new('rbvl', '10000')

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
