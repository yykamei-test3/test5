require 'securerandom'
require 'fileutils'

Array.new(1000) do |idx|
  name = SecureRandom.alphanumeric(SecureRandom.random_number(6..10))
  suffix = %w[txt sh md].sample
  dir = case idx % 5
             when 0
               "app/models/c/"
             when 1
               "prog1/🍛"
             when 2
               "src/lib/🍰"
             when 3
               "house/rep/"
             when 4
               "foo/🚓"
             end
  FileUtils.mkdir_p(dir)
  File.write("#{dir}/#{name}.#{suffix}", <<~DATA)
    ## File #{name}.#{suffix}

    #{SecureRandom.alphanumeric(SecureRandom.random_number(6..10))}

    OK?
  DATA
end
