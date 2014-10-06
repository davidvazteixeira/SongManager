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

  context 'edit' do
    let!(:song_histories) { create_list(:song_history, 5) }
    it 'should rename a song history' do
      (1..5).each do |sh|
        visit edit_song_history_path(sh)
        fill_in 'song_history_proto_name', :with => "SHNew#{sh}"
        click_button 'Update Song history'
        expect(page).to have_content("SHNew#{sh}")
      end
    end
  end

  context 'remove' do
    let!(:song_histories) { create_list(:song_history, 5) }
    it 'should remove a song history' do
      visit song_histories_path
      click_link 'remove-1-sh'
      expect(SongHistory.count).to eq(4)
    end
  end

end
