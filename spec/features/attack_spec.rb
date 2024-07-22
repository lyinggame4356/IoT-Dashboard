feature 'Attack' do

  before do
    allow(Kernel).to receive(:rand).and_return(20)
  end

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  scenario 'attacking player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content "Ed attacked Michael"
  end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP
  scenario 'attacking reduces HP' do
    sign_in_and_play
    attack_and_ok_twice
    expect(page).to have_content('Michael HP: 80')
  end

  # As Player 1,
  # So I can lose a game of Battle,
  # I want Player 2 to attack me, and I want to get a confirmation
  scenario 'player 2 attacking' do
    sign_in_and_play
    click_button('Attack')
    click_button('OK')
    click_button('Attack')
    expect(page).to have_content('Michael attacked Ed')
  end

  # As Player 1,
  # So I can start to lose a game of Battle,
  # I want Player 2's attack to reduce my HP
  scenario 'player 2 attacking reduces player 1 hp' do
    sign_in_and_play
    attack_and_ok_twice
    click_button('Attack')
    click_button('OK')
    expect(page).to have_content('Ed HP: 80')
  end

  # As a Player,
  # So I can play a suspenseful game of Battle,
  # I want all Attacks to deal a random amount of damage
  scenario 'player receives random damage' do
    allow(Kernel).to receive(:rand).and_return(17)
    sign_in_and_play
    click_button('Attack')
    click_button('OK')
    expect(page).to have_content ('Michael HP: 83')
  end

  # As a Player,
  # So I can enjoy a game of Battle with more variety,
  # I want to choose from a range of attacks I could make
  scenario 'player can use another attack' do
    allow(Kernel).to receive(:rand).and_return(45)
    sign_in_and_play
    click_button('Big Attack!')
    click_button('OK')
    expect(page).to have_content ('Michael HP: 55')
  end


end
