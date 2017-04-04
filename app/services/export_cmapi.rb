class ExportCmapi
  def initialize products, users
    @products = products
    @users = users
  end

  def list_product_polular
    ProductPopular.new(@products).list_product_popular
  end

  def check_with_min_sup? a, b
    (Float(a)/Float(b)) > Settings.minsup
  end

  def get_length_max_array_in_cmapi a
    array_length_max = 0
    a.each do |t|
      if t.length > array_length_max
        array_length_max = t.length
      end
    end
    array_length_max
  end

  def get_list_cmapi_first
    array_list_popular_products = list_product_polular
    count_item_popular = array_list_popular_products.length
    cmapi = [] # array have cmapi
    i = 0
    # cmapi with 2 item
    while i < array_list_popular_products.length do
      array_item_check = []
      j = i + 1
      array_item_check.push(array_list_popular_products[i])
      while j < array_list_popular_products.length do
        count = 0
        array_item_check.push(array_list_popular_products[j])
        @users.each do |user|
          list_order_for_users = UserOrder.new(user).list_order_for_user
          list_order_for_users.each do |t|
            if check_valid_array_in_array?(array_item_check, t)
              count += 1
              break
            end
          end
        end
        # tần suất xuất hiện của [product[i], product[j]] trong hệ thống
        if check_with_min_sup? count, @users.length
          cmapi.push([array_list_popular_products[i], array_list_popular_products[j]])
        end
        j = j + 1
      end
      i = i + 1
    end
    cmapi
  end

  def get_list_cmaps_first
    array_list_popular_products = list_product_polular
    count_item_popular = array_list_popular_products.length
    cmaps = [] # array have cmaps
    i = 0
    while i < array_list_popular_products.length do
      j = i +1
      while j < array_list_popular_products.length do
        count = 0
        @users.each do |user|
          list_order_for_users = UserOrder.new(user).list_order_for_user
          array_valid_i = build_array_valid_in_order(array_list_popular_products[i], list_order_for_users)
          array_valid_j = build_array_valid_in_order(array_list_popular_products[j], list_order_for_users)
          if (array_valid_i.include?(1) && array_valid_j.include?(1) && (array_valid_i != array_valid_j))
            count = count +1
          end
        end
        if check_with_min_sup? count, @users.length
          cmaps.push([[array_list_popular_products[i]],[array_list_popular_products[j]]])
        end
        j = j + 1
      end
      i = i + 1
    end
    cmaps
  end

  def build_array_valid_in_order a, list_order_for_user
    array = []
    list_order_for_user.each do |t|
      if t.include? a
        array.push(1)
      else
        array.push(0)
      end
    end
    array
  end

  def get_list_cmapi
    list_cmapi_in_step = []
    array_list_popular_products = list_product_polular
    list_inits = get_list_cmapi_first
    while list_inits.length > 0 do
      array_result = []
      list_inits.each do |list_init|
        list_init_size = list_init.length
        i = 0
        while i < array_list_popular_products.length do
          list_init.push(array_list_popular_products[i])
          b = Array.new(list_init)
          if (list_init.uniq.length > list_init_size)
            count = 0
            @users.each do |user|
              list_order_for_users = UserOrder.new(user).list_order_for_user
              list_order_for_users.each do |t|
                if check_valid_array_in_array?(list_init, t)
                  count += 1
                  break
                end
              end
            end
            if check_with_min_sup?(count, @users.length)
              array_result.push(b)
            end
          end
          list_init.pop
          i = i + 1
        end
      end
      array_result = rebase_array_result_with_dupplicate_item array_result
      list_cmapi_in_step += array_result
      list_inits = array_result
    end
    (get_list_cmapi_first + list_cmapi_in_step)
  end

  def rebase_array_result_with_dupplicate_item array_result
    array_result.each do |t|
      t.sort!
    end
    array_result.uniq
  end

  def check_valid_array_in_array? a, b
    count = 0
    a.each do |t|
      if b.include? t
        count += 1
      end
    end
    (a.length == count)
  end
end
