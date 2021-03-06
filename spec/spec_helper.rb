require "simplecov"
require "vcr"
require "capybara/rspec"
require "capybara/webkit/matchers"
require "support/wait_for_ajax"

SimpleCov.start 'rails'

Capybara.javascript_driver = :webkit

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart"s content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Allows RSpec to persist some state between runs in order to support
  # the `--only-failures` and `--next-failure` CLI options. We recommend
  # you configure your source control system to ignore this file.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://rspec.info/blog/2012/06/rspecs-new-expectation-syntax/
  #   - http://www.teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://rspec.info/blog/2014/05/notable-changes-in-rspec-3/#zero-monkey-patching-mode
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it"s useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed
=end
end

def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:spotify] = OmniAuth::AuthHash.new(
    "uid" => "mock_user",
    "info" => {
      "image" => "mock_user_thumbnail_url"
    },
    "credentials" => {
      "auth_token" => "mock_auth_token",
      "refresh_token" => "mock_refresh_token",
      "expires_at" => "mock_token_expiry"
    }
  )
end

def create_authenticated_user
  user = User.create(uid: "mingus_amongus",
              image: "https://scontent.xx.fbcdn.net/hprofile-xap1/v/t1.0-1/249783_930132649627_927852406_n.jpg?oh=c79ea044bf0027f57b817bd734b46438&oe=57B11642",
              token: "BQDCpfjBCwrOmFnpMBupxg2lLxEDT-4kct7l2f_XpcfMMu14SlMSbPVwLo7amqnUl-_3eKY-0Ef1ZK1_QGNMjGoazRykiTcx2vroxxEfrg_wwknyexYqFrPHaEVLvo9hNL5iuYxSXhU8BapfOWI9sT1t8qu4CM1ymQyrGzPwE48InMVm_qJLVXkqOKiIKaw2vmTxlFRwD16v9_QiIuKDt8riJDpf9CgGTk-6SA7ALmgVGTz-roEHNwG5D8g29AnwPA9RleEhmnXuVUDFOEwnuXk3hF72A4O5244vaVpNuHKk6P-ptRxEpMRUPXYQ",
              refresh_token: "AQD41yPAbRAlYzMAVG18vhVyOblK9jP2lZ_fh2B_EPKDHmzT-XJYnqXnW4TCpkk42DcL3OCH--34GTeUNHtOuDKvOtYSsYWCGrvhZvAp9cSxxnxYBfPZxehAc1Ie2b_Yg7c",
              token_expiry: (Time.now + 1.hour)
  )
end
