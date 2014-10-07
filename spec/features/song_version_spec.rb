require "rails_helper"

RSpec.describe 'SongVersion CRUD' do
  let!(:song_histories) { create_list(:song_history, 5) }
  context 'Create' do
    it 'should create a new song version' do
      song_histories.each do |sh|
        (1..4).each do |sv|
          visit song_history_path(sh)
          click_link 'new-sv'
          fill_in 'song_version_name',
          :with => "version-#{sh.id}-#{sv}-"

          click_button 'Create Song version'
          expect(page).to have_content("version-#{sh.id}-#{sv}-")
        end
      end
    end
  end
  context 'Index' do
    it 'should list the song version tree'
  end
  context 'Show' do
    it 'should show a song version items'
  end
  context 'Edit' do
    it 'should edit a song version item'
    it 'should warn if not the last song version'
  end
  context 'Remove' do
    it 'should remove a song version'
  end
end
