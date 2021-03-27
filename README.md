# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## ## DB 設計

## user table
______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|nickname            |string               |null: false,index: true  |
|email               |string               |null: false              |
|encrypted_password  |string               |null: false              |
|rent                |integer              |null: false              |
|utility_costs       |integer              |null: false              |
|phone               |integer              |null: false              |
|--------------------|---------------------|-------------------------|

### Association

* has_many :salary
* has_many :cost

## salary table

______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|salary              |integer              |null: false              |
|user(FK)            | references          |foreign_key: true        |
|--------------------|---------------------|-------------------------|

### Association

* has_many :cost
* belongs_to :user

## cost table
______________________________________________________________________
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
|food expenses       |integer              |null: false              |
|expenses            |integer              |null: false              |
|expenses_name       |string               |null: false              |
|salary(FK)          | references          | foreign_key: true       |
|--------------------|---------------------|-------------------------|

### Association

* belongs_to :salary

<!-- <% if user_signed_in? %>
<div class="main">
  <div class="header">
    <h1 class="dai">ようこそ！</h1>
    <%= link_to current_user.nickname, "#", class: "dai"%>さん！<br>
  </div>
<a class="dai2"><%= link_to current_user.nickname, "#", class: "dai"%>さんには『給与』と『変動費』を入力してもらいます</a>
<h1 class="dai"> 給与に関しては、手取りの金額 </h1>
<h1 class="dai"> 変動費に関しては、全額</h1>
<h1 class="can">入力してください!!!!!</h1>
<div class="contents row">
  <div class="container">
    <h2>変動費入力フォーム</h2>
    <%= form_with model: @salary, url: salaries_path,  class: 'new_user', local: true do |f| %>
      <div class="field">
        <%= f.label :給与 %><br />
        <%= f.text_field :money, autofocus: true %>
      </div>

      <div class="field">
        <%= f.label :月々の食費 %><br />
        <%= f.text_field :food_expenses, autocomplete: "off" %>
      </div>

       <div class="field">
        <%= f.label :その他の支出。娯楽や趣味%><br />
        <%= f.text_field :expenses, autocomplete: "off" %>
      </div>

      <div class="actions">
        <%= f.submit "完了" %>
      </div>
    <% end %>
  </div>
</div>
<% else %>
<div class="main">
  <div class="header">
    <div class="hheder">
      <h1 class="h1">LCCへようこそ！！！</h1>
        <p class="bun">このアプリケーションは給与に対しての生活コストの最適化を管理するアプリです</p>
    </div>
  </div>
  <div class="center">
    <h1 class="dai"> ＊こんな経験ありませんか？＊ </h1>
      <div class="info">
        <%= link_to image_tag("lco.jpeg", class:"nageki"), "#" %>
        <div class="list">
         <ul>・今月の生活費が足りない</ul>
          <ul>・なぜか今月生活が辛い</ul>
          <ul>・不明な出費が嵩んで生活を圧迫している</ul>
          <ul>・貯金がうまくできない</ul>
        </div>
      </div>
    <h1 class="dai2">『原因は生活費を管理していないから』</h1>
    <h1>このアプリでは</h1>
      <div class="list2">
        <a class="kane">『給与』</a>
        <a>ー<a>
        <a class="kane">固定費</a>
        <a>(家賃・光熱費・交通費)<a>
        <a>＋<a>
        <a class="kane">変動費</a>
        <a>(食費・生活用品・雑費)<a>
      </div>
    <h1 class="saigo">これらを自動で計算し、生活コストの最適化を提案します！</h1>
  </div>
  <div class="footer">
    <h1 class="fot">＊まずは試しにやってみよう！＊</h1>
      <form>
        <a class="fon">給与</a>
        <input type="text">
        <a class="fon"> 固定費</a>
        <input type="text"> </a>
        <a class="fon"> 変動費</a>
        <input type="text">
        <input type="submit" value="計算してみる" class="submit">
      </form>
    <h1 class="botton">＊会員登録がお済みでない方は利用できない場合があります＊</h1>
  </div>
</div>
<% end %>





 <%= link_to current_user.nickname, "#", class: "dai"%>さん<br>
<div class="omain">
  <div class="out">
    <div class="kan">＊管理人から一言＊</div>
  <h1 class="suggestion">
<% @salary.each  do  |salary|%>
    <% if current_user.rent > 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && salary.money < 240000 && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
      <%= "お前みたいなゴミ野郎はなかなかいないぞ。頭も悪いし楽観主義者。お前の人生だから好きにしたらいいけど" %>
    <% elsif current_user.rent < 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
      <%= "無駄な出費が多過ぎます。身の丈を考えて生活してみては？このままではあなたの人生高確率で終わりますよ" %>
    <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
      <%= "光熱費は問題ないですが、これは単純にあまり家にいないだけじゃないですか？無駄な出費が多いです。努力次第で貯金できる様になりますよ" %>
    <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
      <%= "光熱費・食費をしっかり節約できています。ただ無駄な出費が若干多くみられます。特に携帯料金。不要なオプションは解約して料金プランも一度見直しましょう" %>
    <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
      <%= "かなり節制できています。ただ無駄な出費が目立ちます。その出費を将来の為の投資をしてみては如何でしょうか" %>
    <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 200000  && salary.food_expenses < 40000 && salary.expenses< 20000%><br>
      <%= "素晴らしいです。ただ、給与低過ぎてあなたの人生を蝕んでいます。転職やあなたの人生を輝かせる投資をしてみては如何でしょうか。" %>
    <% else %><br>
     <%= "素晴らしいです。今の時代のニーズに合った生活を送れています。継続は力なり" %></h1>
    <%end%>
  </div>
</div>
<%end%> 



<%= link_to current_user.nickname, "#", class: "dai"%>さん<br>
<div class="omain">
  <div class="out">
    <div class="kan">＊管理人から一言＊</div>
  <h1 class="suggestion">
    <%# @salary.each  do  |salary|%>
      <% if current_user.rent > 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && @salary.money < 240000 && @salary.food_expenses > 40000 && @salary.expenses> 20000%><br>
        <%= "お前みたいなゴミ野郎はなかなかいないぞ。頭も悪いし楽観主義者。お前の人生だから好きにしたらいいけど" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
        <%= "無駄な出費が多過ぎます。身の丈を考えて生活してみては？このままではあなたの人生高確率で終わりますよ" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
        <%= "光熱費は問題ないですが、これは単純にあまり家にいないだけじゃないですか？無駄な出費が多いです。努力次第で貯金できる様になりますよ" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
        <%= "光熱費・食費をしっかり節約できています。ただ無駄な出費が若干多くみられます。特に携帯料金。不要なオプションは解約して料金プランも一度見直しましょう" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
        <%= "かなり節制できています。ただ無駄な出費が目立ちます。その出費を将来の為の投資をしてみては如何でしょうか" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 200000  && salary.food_expenses < 40000 && salary.expenses< 20000%><br>
        <%= "素晴らしいです。ただ、給与低過ぎてあなたの人生を蝕んでいます。転職やあなたの人生を輝かせる投資をしてみては如何でしょうか。" %>
      <% else %><br>
       <%= "素晴らしいです。今の時代のニーズに合った生活を送れています。継続は力なり" %></h1>
      <%end%>
    <%#end%> 
  </div>
</div>

<%= link_to current_user.nickname, "#", class: "dai"%>さん<br>
<div class="omain">
  <div class="out">
    <div class="kan">＊管理人から一言＊</div>
  <h1 class="suggestion">
    <%# @salary.each  do  |salary|%>
      <% if current_user.rent > 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && @salary.money < 240000 && @salary.food_expenses > 40000 && @salary.expenses> 20000%><br>
        <%= "お前みたいなゴミ野郎はなかなかいないぞ。頭も悪いし楽観主義者。お前の人生だから好きにしたらいいけど" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs > 15000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
        <%= "無駄な出費が多過ぎます。身の丈を考えて生活してみては？このままではあなたの人生高確率で終わりますよ" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 15000 && salary.money < 240000  && salary.food_expenses > 40000 && salary.expenses> 20000%><br>
        <%= "光熱費は問題ないですが、これは単純にあまり家にいないだけじゃないですか？無駄な出費が多いです。努力次第で貯金できる様になりますよ" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone > 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
        <%= "光熱費・食費をしっかり節約できています。ただ無駄な出費が若干多くみられます。特に携帯料金。不要なオプションは解約して料金プランも一度見直しましょう" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 240000  && salary.food_expenses < 40000 && salary.expenses> 20000%><br>
        <%= "かなり節制できています。ただ無駄な出費が目立ちます。その出費を将来の為の投資をしてみては如何でしょうか" %>
      <% elsif current_user.rent < 70000 && current_user.utility_costs < 10000 && current_user.phone < 14000 && salary.money < 200000  && salary.food_expenses < 40000 && salary.expenses< 20000%><br>
        <%= "素晴らしいです。ただ、給与低過ぎてあなたの人生を蝕んでいます。転職やあなたの人生を輝かせる投資をしてみては如何でしょうか。" %>
      <% else %><br>
       <%= "素晴らしいです。今の時代のニーズに合った生活を送れています。継続は力なり" %></h1>
      <%end%>
    <%#end%> 
  </div>
</div> -->