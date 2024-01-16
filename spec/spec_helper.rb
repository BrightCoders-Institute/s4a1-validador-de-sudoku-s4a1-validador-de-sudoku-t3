require './spec/board_spec.rb'
require './spec/validate_sudoku_spec.rb'

PROJECT_ROOT = File.expand_path('..', __dir__)

Dir.glob(File.join(PROJECT_ROOT, 'lib', '*.rb')).each do |file|
 autoload File.basename(file, '.rb').camelize, file
end

RSpec.configure do |config|
end