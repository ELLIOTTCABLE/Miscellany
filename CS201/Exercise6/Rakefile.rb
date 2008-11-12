SourcePath =  File.expand_path(File.join( File.dirname(__FILE__), 'src'   ))
LibraryPath = File.expand_path(File.join( File.dirname(__FILE__), 'lib'   ))
BuildPath =   File.expand_path(File.join( File.dirname(__FILE__), 'build' ))

Library = Dir[File.join(LibraryPath, '*')]

# rake source:{build,run}[Whatever]
namespace :source do
  
  desc 'compiles the Java source into bytecode'
  task :build, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :homework].map(&:to_s)
    bits += params[:identifier].split '.'
    
    command = ['javac']
    command << "-classpath #{Library.join ':'}" unless Library.empty?
    command << "-sourcepath #{SourcePath}"
    command << "-d #{BuildPath}"
    command << "#{ File.join(SourcePath, bits) }.java"
    system command.join ' '
  end
  
  desc 'runs the main() function'
  task :run, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :homework].map(&:to_s)
    bits += params[:identifier].split '.'
    
    command = ['java']
    command << "-classpath #{ [BuildPath, Library].join ':' }"
    command << "#{ bits.join('.') }"
    system command.join ' '
  end
  
end

# rake runner:{build,run}[Whatever]
namespace :runner do
  
  desc 'compiles the Java runner into bytecode'
  task :build, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :runners].map(&:to_s)
    bits += params[:identifier].split '.'
    
    command = ['javac']
    command << "-classpath #{Library.join ':'}" unless Library.empty?
    command << "-sourcepath #{SourcePath}"
    command << "-d #{BuildPath}"
    command << "#{ File.join(SourcePath, bits) }Runner.java"
    system command.join ' '
  end
  
  desc 'runs the main() function'
  task :run, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :runners].map(&:to_s)
    bits += params[:identifier].split '.'
    
    command = ['java']
    command << "-classpath #{ [BuildPath, Library].join ':' }"
    command << "#{ bits.join('.') }Runner"
    system command.join ' '
  end
  
end

def needs_identifier! arg
  raise 'you must pass an identifier as an argument' unless arg
end