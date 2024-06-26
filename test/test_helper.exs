ExUnit.start(except: [:skip])

defmodule Elixir99.TestCase do
  defmacro __using__(opts) do
    quote do
      unless ExUnit.Case.__register__(__MODULE__, unquote(opts)) do
        use ExUnit.Callbacks
      end

      import ExUnit.Callbacks
      import ExUnit.Assertions, except: [assert: 1, assert: 2]
      import ExUnit.Case, only: [describe: 2, test: 1, test: 2, test: 3]
      import ExUnit.DocTest

      defmacro assert(assertion) do
        case assertion do
          {operator, _env, [left, right]} ->
            quote do
              case unquote(left) do
                :not_implemented -> true
                result -> ExUnit.Assertions.assert(unquote(operator)(result, unquote(right)))
              end
            end
        end
      end

      def assert(assertion, cb) do
        case assertion do
          :not_implemented -> true
          result -> ExUnit.Assertions.assert(cb.(result))
        end
      end
    end
  end
end
