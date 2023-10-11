# frozen_string_literal: true

RSpotify.authenticate(ENV.fetch('CLIENT_ID', ''), ENV.fetch('CLIENT_SECRET', ''))
