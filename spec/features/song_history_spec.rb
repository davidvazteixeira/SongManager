require "rails_helper"

describe 'SongHistory CRUD' do
  context 'Create' do
    it 'should create a new song history' do
      visit new_song_history_path
      fill_in 'song_history_proto_name', :with => 'SongHistoryPronameTest'
      click_button 'Create Song history'
      expect(page).to have_content('SongHistoryPronameTest')
    end
  end

  context 'list' do
    let!(:song_histories) { create_list(:song_history, 5) }
    # ! é para retirar o atributo lazzy evaluation
    it 'should list all song histories' do
      visit song_histories_path
      song_histories.each do |p|
        expect(page).to have_content(p.proto_name)
      end
    end
  end

end
