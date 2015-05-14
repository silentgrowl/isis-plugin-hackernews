require "ruby-hackernews"

module Isis
  module Plugin
    class HackerNews < Isis::Plugin::Base
      TRIGGERS = %w(!hn !hackernews)

      def respond_to_message?(message)
        TRIGGERS.include? message.content.downcase
      end

      private

      def response_html
        entries = RubyHackernews::Entry.all[0..4]
        output = '<img src="http://i.imgur.com/BskroOr.png"> HackerNews Top Stories'
        output += " - #{timestamp} #{zone}<br>"
        entries.reduce(output) do |a, e|
          a += "<a href=\"#{url_format(e.link.href)}\">#{e.link.title}</a> (#{e.voting.score} points by #{e.user.name})<br>"
        end
      end

      def response_md
        entries = RubyHackernews::Entry.all[0..4]
        output = 'HackerNews Top Stories'
        output += " - #{timestamp} #{zone}\n"
        entries.reduce(output) do |a, e|
          a += "<#{url_format(e.link.href)}|#{e.link.title}> (#{e.voting.score} points by #{e.user.name})\n"
        end
      end

      def response_text
        entries = RubyHackernews::Entry.all[0..4]
        entries.reduce(["HackerNews Top Stories - #{timestamp} #{zone}"]) do |a, e|
          a.push "#{e.link.title}: #{url_format(e.link.href)}"
        end
      end

      private

      def url_format(url)
        url =~ /(http|https):\/\// ? url : "http://news.ycombinator.com/#{url}"
      end
    end
  end
end
