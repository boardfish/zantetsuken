# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # :nodoc:
    class Intercom < Base
      ruleset do
        self.script_src = %i[unsafe_inline unsafe_eval strict_dynamic https http]
        self.connect_src = [
          'https://api.intercom.io', 'https://api-iam.intercom.io', 'https://api-ping.intercom.io',
          'https://nexus-websocket-a.intercom.io', 'https://nexus-websocket-b.intercom.io',
          'wss://nexus-websocket-a.intercom.io', 'wss://nexus-websocket-b.intercom.io',
          'https://uploads.intercomcdn.com', 'https://uploads.intercomusercontent.com'
        ]
        self.child_src = [
          'https://intercom-sheets.com', 'https://www.intercom-reporting.com ', 'https://www.youtube.com',
          'https://player.vimeo.com', 'https://fast.wistia.net'
        ]
        self.font_src = ['https://js.intercomcdn.com', 'http://fonts.intercomcdn.com']
        self.form_action = ['https://intercom.help', 'https://api-iam.intercom.io']
        self.media_src = 'https://js.intercomcdn.com'
        self.img_src = [
          :blob, :data, 'https://js.intercomcdn.com', 'https://static.intercomassets.com',
          'https://downloads.intercomcdn.com', 'https://uploads.intercomusercontent.com',
          'https://gifs.intercomcdn.com', 'https://video-messages.intercomcdn.com',
          'https://messenger-apps.intercom.io', 'https://*.intercom-attachments-5.com',
          'https://*.intercom-attachments-6.com', 'https://*.intercom-attachments-9.com'
        ]
        self.script_src = ['https://app.intercom.io', 'https://widget.intercom.io', 'https://js.intercomcdn.com']
        self.style_src = :unsafe_inline
      end
    end
  end
end
