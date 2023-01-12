# Setting Up a Sinatra Project

_**This is a Makers Vine.** Vines are designed to gradually build up sophisticated skills. They contain a mixture of text and video, and may contain some challenge exercises without proposed solutions. [Read more about how to use Makers
Vines.](https://github.com/makersacademy/course/blob/main/labels/vines.md)_

Learn to setup a Ruby project with the Sinatra library.

<!-- OMITTED -->

## Sinatra

[Sinatra](http://sinatrarb.com/intro.html) is a small Ruby library we use to create web server programs using Ruby. We use Sinatra to configure which requests our program can respond to, and what logic needs to be done to respond to those requests.

In the following exercises and challenges, you will learn how to build a web server program that receives HTTP requests from a client (such as Postman), and returns HTTP responses to it.

## Demonstration

[Video demonstration](https://www.youtube.com/watch?v=1j0PS6e0CZk)

## Setting up

[Follow this guidance](../pills/setting_up_sinatra_project.md) to setup a new project directory `hello_web_project` with RSpec and Sinatra.

We've got two different ways to interact with the program:
  * By running RSpec tests that will simulate HTTP requests and assert on responses.
  * By running the web server as a background program, using `rackup`, so we can manually send requests to it.

Launch your server program with the `rackup` command from your project directory:

```
$ rackup

[2022-05-27 12:26:42] INFO  WEBrick 1.7.0
[2022-05-27 12:26:42] INFO  ruby 3.0.1 (2021-04-05) [x86_64-darwin20]
[2022-05-27 12:26:42] INFO  WEBrick::HTTPServer#start: pid=87298 port=9292
```

We can now send HTTP requests using `curl`:

```
curl http://localhost:9292
```

(`localhost` is the host name for your local machine, and 9292 is the network port on which Sinatra is running).

## Working Locally

Something to be mindful of: in real-word programs, the web server program will usually be running on a remote machine, and you will access it through the Internet (like you did in the previous exercises, with `curl` and Postman).

In the following challenges, you will _build_ such web server programs, which means that while you're building it, it will run on your machine. This is called working "locally", on a "local server", or "local setup", as opposed to the program being deployed in production, to real users.

It's therefore important not to forget this: **the web server programs you will build this week are meant, in the end, to be run on remote machines, and interacted with through HTTP requests and responses**. Later on in this module, you will learn how to deploy your web server on a remote machine, which is closer to how things work in the "real world".

[Next Challenge](02_building_a_route.md)

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F01_setting_up_sinatra_project.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F01_setting_up_sinatra_project.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F01_setting_up_sinatra_project.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F01_setting_up_sinatra_project.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=challenges%2F01_setting_up_sinatra_project.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
