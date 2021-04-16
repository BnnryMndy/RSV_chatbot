$(document).ready(function() {
    // var awnsers = 1;

    // $('.awnser.delete').on("click", function(event) {
    //     event.target
    // });

    //

    $('.task #add-awnser').on("click", function(event) {
        // var AddAwnserButton = $(event);
        // console.log("clicked: " + event.target.nodeName);

        var awnser = document.createElement("div");
        awnser.innerHTML = '<fieldset class="awnser" id=""> <legend> Добавление ответа </legend><input placeholder = "Тип реакции" name = "ReactionType" list = "ReactionType"><input placeholder = "реакция" name = "reaction" type = "text"><input type="text" name="awnser" placeholder="ответ"></fieldset>';
        this.before(awnser);
    });

});