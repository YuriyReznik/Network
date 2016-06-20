// function OpenNewMessageForm(){
//     document.getElementById('new_message_form').innerHTML =
//         ' <%= form_for @message, html: { multipart: true } do |f|%>
//             <%= f.file_field :image %>
//              <%= f.hidden_field :user_1_id, :value => current_user.id %>
//         <%= f.hidden_field :user_2_id, :value => params[:user_2_id] %>
// <p>Content: <br><%=  f.text_area :content %></p>
//     <p><%=  f.submit 'Save' %></p>
//     <% end %>'
// }