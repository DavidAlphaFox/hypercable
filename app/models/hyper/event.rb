# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  browser            :string
#  city               :string
#  country            :string
#  data_source        :string           default("web")
#  device_type        :string
#  engagement_time    :integer
#  event_name         :string           default("page_view")
#  event_props        :jsonb
#  hostname           :string
#  ip                 :string
#  latitude           :float
#  location_url       :string
#  longitude          :float
#  os                 :string
#  path               :string
#  protocol_version   :string           default("2")
#  raw_event          :jsonb
#  referrer           :string
#  referrer_source    :string
#  region             :string
#  request_number     :integer
#  screen_resolution  :string
#  session_count      :integer
#  session_engagement :boolean          default(FALSE)
#  started_at         :datetime         not null
#  title              :string
#  traffic_campaign   :string
#  traffic_medium     :string
#  traffic_source     :string
#  user_agent         :string
#  user_language      :string
#  user_props         :jsonb
#  client_id          :string           not null
#  session_id         :string           not null
#  site_id            :string           not null
#  tracking_id        :string           not null
#  user_id            :string
#
# Indexes
#
#  events_started_at_idx                                  (started_at)
#  index_events_on_site_id_and_session_id_and_started_at  (site_id,session_id,started_at DESC)
#
module Hyper
  class Event < ApplicationHyperRecord
    def display_path
      return nil if location_url.blank?
      URI.parse(location_url).normalize.path
    end
  end
end
