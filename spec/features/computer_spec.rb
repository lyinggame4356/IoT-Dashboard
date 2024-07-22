feature 'Computer player' do
  scenario 'One player can play against a robot' do
    sign_in_and_robo_play
    click_button('Attack')
    click_button('OK')
    expect(page).to have_content 'Computer attacked Ed'
  end
end
