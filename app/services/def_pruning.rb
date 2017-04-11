class DefPruning
  $global_count = 3
  def initialize
    @products = Product.all
    @users = User.all
    @export_cmap = ExportCmapi.new(@products, @users)
  end

  def list_product_polular
    ProductPopular.new(@products, @users).list_product_popular
  end

  def list_cmapi
    @export_cmap.get_list_cmapi_first
  end

  def list_cmaps
    @export_cmap.get_list_cmaps_first
  end

  def get_Stemp_for_each_sequence a, array_cmaps
    stemp = []
    array_cmaps.each do |array_cmap|
      if array_cmap.include?([a])
        stemp.push(array_cmap[1][0])
      end
    end
    stemp
  end

  def get_Itemp_for_each_sequence a, array_cmapi
    itemp = []
    array_cmapi.each do |array_cmap|
      if array_cmap.include?(a)
        itemp.push(array_cmap[1])
      end
    end
    itemp
  end

  def build_list_sequence_step
    array_results = []
    list_product_polulars = list_product_polular
    list_product_polulars.each do |t|
      array_results.push([t])
      get_Stemp_for_each_sequence(t, list_cmaps)
      s_temp = get_Stemp_for_each_sequence(t, list_cmaps)
      temp_i = get_Itemp_for_each_sequence(t, list_cmapi)
      i = 0
      i_temp = s_temp
      while i < s_temp.length
        j = 0
        while j < s_temp.length
          if s_temp[j].nil?
            array_results.push([t])
          else
            if s_temp[j] != t
              array_results.push([[t],[s_temp[j]]])
            else
              array_results.push([t])
            end
          end
          if temp_i.include?(s_temp[j])
            array_check = [[t],[s_temp[i], s_temp[j]]]
            b = Array.new(array_check)
            count = 0
            @users.each do |user|
              list_order_for_users = UserOrder.new(user).list_order_for_user
              array_check_for_product = product_in_order(t, list_order_for_users)
              array_check_for_products = list_product_in_order([s_temp[i], s_temp[j]], list_order_for_users)
              if (array_check_for_product.include?(1) && array_check_for_products.include?(1) && (array_check_for_product != array_check_for_products))
                count = count +1
              end
            end
            if check_with_min_sup? count, @users.length
              array_results.push(b)
              z = j + 1
              a1 = [s_temp[i], s_temp[j]]
              while z < s_temp.length
                a1.push(s_temp[z])
                array_ckeck_list = [[t],a1]
                c = Array.new(array_ckeck_list)
                count_1 = 0
                @users.each do |user|
                  list_order_for_users = UserOrder.new(user).list_order_for_user
                  array_check_for_product_z = product_in_order(t, list_order_for_users)
                  array_check_for_products_z = list_product_in_order(a1, list_order_for_users)
                  if (array_check_for_product_z.include?(1) && array_check_for_products_z.include?(1) && (array_check_for_product_z != array_check_for_products_z))
                    count_1 = count_1 +1
                  end
                end
                if check_with_min_sup? count_1, @users.length
                  array_results.push(c)
                else
                  a1.pop
                  break
                end
                z = z + 1
              end
            end
          end
          j = j + 1
        end
        i = i + 1
      end
    end
    array_results.uniq
  end

  def build_list_sequence_itep
    array_results = []
    list_product_polulars = list_product_polular
    list_product_polulars.each do |t|
      temp_i = get_Itemp_for_each_sequence(t, list_cmapi)
      i = 0
      while i < temp_i.length
        if t != temp_i[i]
          array_results.push([t, temp_i[i]])
        end
        j = 0
        while j < temp_i.length
          if (temp_i[i] != temp_i[j])
            array_check_itemp = [t, temp_i[i], temp_i[j]]
            d = Array.new(array_check_itemp)
            count = 0
            @users.each do |user|
              list_order_for_users = UserOrder.new(user).list_order_for_user
              list_order_for_users.each do |e|
                if check_two_array_relationship?(e,array_check_itemp)
                  count = count + 1
                  break
                end
              end
            end
            if check_with_min_sup? count, @users.length
              array_results.push(d)
              array_check_list_itemp = array_check_itemp
              k = Array.new(array_check_list_itemp)
              z = j + 1
              while z < temp_i.length
                array_check_list_itemp.push(temp_i[z])
                count_i_product = 0
                @users.each do |user|
                  list_order_for_users = UserOrder.new(user).list_order_for_user
                  list_order_for_users.each do |e|
                    if e.include?(array_check_list_itemp)
                      count_i_product = count_i_product + 1
                      break
                    end
                  end
                end
                if check_with_min_sup? count_i_product, @users.length
                  array_results.push(k)
                else
                  array_check_list_itemp.pop
                  break
                end
                z = z + 1
              end
            end
          end
          j = j + 1
        end
        i = i + 1
      end
    end
    array_results.each do |array_result|
      array_result.sort!
    end
    array_results.uniq
  end


  def build_list_sequence
    build_list_sequence_itep + build_list_sequence_step
  end

  def check_two_array_relationship? a, b
    c = a - b
    (a.length - b.length) == c.length
  end

  def list_product_in_order a, order_of_users
    array_check = []
    order_of_users.each do |order_of_user|
      length_product_in_order = order_of_user.length
      length_for_array_check = a.length
      if length_product_in_order >= length_for_array_check
        c = (order_of_user - a).length
        if ((length_product_in_order - c) == length_for_array_check)
          array_check.push(1)
        else
          array_check.push(0)
        end
      else
        array_check.push(0)
      end
    end
    array_check
  end

  def check_with_min_sup? a, b
    (Float(a)/Float(b)) > Settings.minsup
  end

  def product_in_order a, order_of_users
    array_check = []
    order_of_users.each do |order_of_user|
      if order_of_user.include?(a)
        array_check.push(1)
      else
        array_check.push(0)
      end
    end
    array_check
  end

end
