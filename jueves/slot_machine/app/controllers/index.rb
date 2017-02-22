get '/' do
  @rolls = []

  3.times { @rolls << Roll.create }

  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index
end

# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es
# de Ajax de igual forma sirva.
post '/rolls' do
  # p "PARAMS!!! ---- #{params}"
  @rolls = []

  if params[:value]
    3.times { @rolls << Roll.create({ value: value }) }
  else
    3.times { @rolls << Roll.create }
  end
  # p "ROLLS !!! #{@rolls}"
  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :_die_roll, layout: false  # TIP: Qué está haciendo esto y qué debe hacer diferente.
end