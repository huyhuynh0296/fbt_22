module CartsHelper
  def init_session_cart
    session[:cart] ||= {}
  end
  def init_session_date
    session[:date] ||= {}
  end
  def cart_items
    Tour.where id: cart_item_ids
  end

  def cart_item_ids
    init_session_cart

    session[:cart].map{|tour_id, _| tour_id}
    # session[:date].map{|tour_id, _| tour_id}
  end


  def total_price_of_item tour
    get_session_cart(tour.id).to_i * tour.price.to_i
  end

  def delete_cart_item tour_id
    init_session_cart
    session[:cart].delete tour_id
  end

  def find_date_tour tour_id
    @dates = Datetour.find_by_id tour_id
  end

  def add_to_cart options
    session_cart = init_session_cart
    session_date = init_session_date
    tour_id = options[:tour_id]
    quantity = options[:quantity].to_i
    date = options[:date].to_i
    return unless Tour.find_by id: tour_id
    cart_item = session_cart[tour_id]
    session_date[tour_id] = date
      session_cart[tour_id] =
        if cart_item
          cart_item.to_i + quantity
        else
          quantity
        end
    # save_booktour(params[:tour_id], params[:date])
  end

  def update_cart options
    session_cart = init_session_cart
    tour_id = options[:tour_id]
    quantity = options[:quantity].to_i
    date = options[:date].to_i

    return if session_cart[tour_id].blank? || quantity <= 0

    session_cart[tour_id] = quantity
  end

  def get_session_cart tour_id
    session[:cart][tour_id.to_s]
  end

  def total_price_of_items
    cart_items.inject(0) do |sum, item|
      sum + total_price_of_item(item)
    end
  end

  def cart_total_item
    init_session_cart

    session[:cart].inject(0){|sum, (_, quantity)| sum + quantity.to_i}
  end
end
