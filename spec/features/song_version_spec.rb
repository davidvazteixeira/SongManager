require "rails_helper"

RSpec.describe 'SongVersion CRUD' do
  let!(:song_histories) { create_list(:song_history, 5) }
  let!(:song_history) { create(:song_history) }
  let!(:song_version) { create( :song_version, song_history: song_history) }

  context 'Create' do
    it 'should create a new song version' do
      visit song_history_path(song_history)
      click_link 'new-sv'
      fill_in 'song_version_name', :with => "Version_name"
      click_button 'Create Song version'
      expect(page).to have_content("Version_name")
    end
  end

  context 'Show' do
    it 'should show a song version items' do
      visit song_history_song_version_path(song_history, song_version)
      expect(page).to have_content(song_version.name)
    end
  end

  context 'Edit' do
    it 'should edit a song version item' do
      visit edit_song_history_song_version_path(song_history, song_version)
      new_version_name = 'MOD-Version'
      fill_in 'song_version_name', :with => new_version_name
      click_button 'Update Song version'
      expect(page).to have_content(new_version_name)
    end
  end

  context 'Remove' do
    it 'should remove a song version' do
      visit song_history_song_version_path(song_history, song_version)
      click_link 'del-sv'
      visit song_history_path(song_history)
      expect(page).to have_no_content(song_version.name)
    end
  end

end
