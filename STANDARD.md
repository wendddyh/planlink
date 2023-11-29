# ICON
<i class="fa-solid fa-dog"></i>
<i class="fa-solid fa-location-dot"></i>
<i class="fa-solid fa-utensils"></i>
<i class="fa-solid fa-phone"></i>
<i class="fa-solid fa-heart"></i>
<i class="fa-solid fa-wine-glass"></i>
<i class="fa-solid fa-paw"></i>
<i class="fa-solid fa-smoking"></i>
<i class="fa-solid fa-ferry"></i>

# FONT
$heading: 'Anton', sans-serif;
$paragraph: 'Urbanist', sans-serif;


# COLOR
$primary: #9395D3;
$secondary: #A2A3BB;
$tertiary: #B3B7EE;
$black: #000807;
$white: ##FBF9FF



for home list
 <div
    data-controller="tabs"
    data-tabs-active-class="activetab"
    data-tabs-default-tab-value="tab1">

    <!-- buttons to toggle between tabs -->
    <div class="flex">
      <button id="tab1" data-tabs-target="btn" data-action="click->tabs#select">List</button>
      <button id="tab2" data-tabs-target="btn" data-action="click->tabs#select">Maps</button>
    </div>

    <!-- the tabs -->
    <div class="tab-body">
      <div data-tabs-target="tab" id="tab1">
        <%= render 'list' %>
      </div>

      <!-- tab 2 is hidden by default, to prevent 'flashing in' -->
      <div data-tabs-target="tab" id="tab2" class='hidden'>
        <%= render 'map' %>
      </div>
    </div>
  </div>
