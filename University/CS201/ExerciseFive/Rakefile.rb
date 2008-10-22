SourcePath =  File.expand_path(File.join( File.dirname(__FILE__), 'src'   ))
LibraryPath = File.expand_path(File.join( File.dirname(__FILE__), 'lib'   ))
BuildPath =   File.expand_path(File.join( File.dirname(__FILE__), 'build' ))

Library = Dir[File.join(LibraryPath, '*')]

# rake source:{build,run}[name.elliottcable.homework.Rational]
namespace :source do
  
  desc 'compiles the Java source into bytecode'
  task :build, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :homework].map(&:to_s)
    bits += params[:identifier].split '.'
    
    file =  File.join( SourcePath, bits )
    system "javac -classpath #{Library.join ':'} -sourcepath #{SourcePath} -d #{BuildPath} #{file}.java"
  end
  
  desc 'runs the main() function'
  task :run, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    system "java -classpath #{[BuildPath, Library].join ':'} #{params[:identifier]}"
  end
  
end

# rake tests:{build,run}[name.elliottcable.homework.Rational]
namespace :tests do
  
  desc 'builds the tests'
  task :build, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :tests].map(&:to_s)
    bits += params[:identifier].split '.'
    
    file =  File.join( SourcePath, bits )
    system "javac -classpath #{Library.join ':'} -sourcepath #{SourcePath} -d #{BuildPath} #{file}Test.java"
  end
  
  desc 'runs the tests'
  task :run, :identifier do |_, params|
    needs_identifier! params[:identifier]
    
    bits = [:name, :elliottcable, :tests].map(&:to_s)
    bits += params[:identifier].split '.'
    
    identifier = bits.join('.')
    system "java -classpath #{[BuildPath, Library].join ':'} org.junit.runner.JUnitCore #{identifier}Test"
  end
  
  task :open do
    
  end
  
end

def needs_identifier! arg
  raise 'you must pass an identifier as an argument' unless arg
end