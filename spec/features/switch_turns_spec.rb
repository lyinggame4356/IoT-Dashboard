  # As two Players,
  # So we can continue our game of Battle,
  # We want to switch turns

feature 'Switch Turns' do
  scenario 'switching turns' do
    sign_in_and_play
    click_button('Attack Michael')
    click_button('OK')
    expect(page).to have_button ('Attack Ed')
  end
end
