require "rails_helper"

describe "SongHistory CRUD" do
  it 'should create a new song history' do
    visit new_song_history_path
    fill_in 'song_history_proto_name', :with => 'SongHistoryPronameTest'
    click_button "Create Song history"
    expect(page).to have_content('SongHistoryPronameTest')
  end

end
