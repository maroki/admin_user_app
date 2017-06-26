class UserInfo < Prawn::Document

  attr_reader :user

  def initialize(user)
    @user = user
    super({})
  end

  def content

    move_down 20
    text 'User info', style: :bold, size: 14, color: '213242', align: :center
    move_down 20

    table_data = build_table_data

    table(table_data) do
      row(0).style background_color: '083c6e', text_color: 'ffffff', border_color: 'e1e1e8'
      cells.style border_color: 'e1e1e8'
    end

    render
  end

  private

  def build_table_data
    [ ['ID', user.id],
      ['Full name', user.full_name],
      ['e-mail', user.email],
      ['Birth date', user.birth_date || '-'],
      ['Bio', user.bio || '-'],
      ['Avatar', user.avatar.present? ? { image: user.avatar.path(:medium) } : 'None']
    ]
  end
end
