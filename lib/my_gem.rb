require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

module MyGem
  # ...
end

loader.eager_load # optionally