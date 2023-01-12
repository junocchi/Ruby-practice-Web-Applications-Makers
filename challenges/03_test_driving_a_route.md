# Test-driving a Route

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to write an integration test for a route using RSpec.

## Testing Routes with RSpec

We can create integration tests for our routes using RSpec. Here's an example:

```ruby
# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Some response data")
    end
  end

  context "POST to /submit" do
    it "returns 200 OK with the right content" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/submit", name: "Dana", some_other_param: 12)

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Dana")
    end
  end
end
```

_In the following exercises, we will use the shorthand notation `GET /some_path` (or `POST /some_path`) to designate a route which responds to `GET` HTTP requests to the path `/some_path`._ 


## Design Recipe

We'll use [this Design recipe](../resources/sinatra_route_design_recipe_template.md) to support the process of design and test-driving of routes.

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=NwKBtzkZrJo)

## Exercise

_Work in the same project directory `hello_web_project` for the following exercises._

Use the Design recipe to test-drive the following route:

```
# Request:
GET /names

# Expected response (2OO OK):
Julia, Mary, Karim
```

You should assert that the response status code is `200` and that the response body is the correct string.

## Challenge

This is a process feedback challenge. That means you should record yourself doing it and
submit that recording to your coach for feedback. [How do I do
this?](https://github.com/makersacademy/golden-square/blob/main/pills/process_feedback_challenges.md)

Test-drive a new route `POST /sort-names` which receives a list of names (as a comma-separated string) and return the same list, sorted in alphabetical order.

Here's a description of the expected behaviour:

```
# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe
```

[After you're done, submit your recording here](https://airtable.com/shrNFgNkPWr3d63Db?prefill_Item=web_as01).

[Next Challenge](04_creating_a_sequence_diagram.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F03_test_driving_a_route.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
