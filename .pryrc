require "rubygems"
require "awesome_print"

AwesomePrint.defaults = {
  :indent     => 4,      # Indent using 4 spaces.
  :index      => true,   # Display array indices.
  :html       => false,  # Use ANSI color codes rather than HTML.
  :multiline  => true,   # Display in multiple lines.
  :plain      => false,  # Use colors.
  :raw        => false,  # Do not recursively format object instance variables.
  :sort_keys  => false,  # Do not sort hash keys.
  :limit      => false,  # Limit large output for arrays and hashes. Set to a boolean or integer.
  :color => {
    :args       => :yellowish,
    :array      => :white,
    :bigdecimal => :cyanish,
    :class      => :yellow,
    :date       => :greenish,
    :falseclass => :red,
    :fixnum     => :cyanish,
    :float      => :cyanish,
    :hash       => :yellow,
    :keyword    => :cyan,
    :method     => :purpleish,
    :nilclass   => :red,
    :rational   => :cyanish,
    :string     => :yellowish,
    :struct     => :yellow,
    :symbol     => :cyanish,
    :time       => :greenish,
    :trueclass  => :green,
    :variable   => :cyanish
  }
}

Pry.print = proc { |output, value| output.puts value.ai }


Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
