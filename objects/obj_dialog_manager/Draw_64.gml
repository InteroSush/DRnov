// DRAW EVENT
if (box_alpha > 0.01) {
    // Окно диалога (чёрное с белой обводкой)
    draw_set_alpha(box_alpha);
    
    // Основное окно
    draw_rectangle_color(text_box_x, text_box_y, 
                        text_box_x + text_box_width, 
                        text_box_y + text_box_height, 
                        c_black, c_black, c_black, c_black, false);
    
    // Белая обводка
    draw_rectangle_color(text_box_x - 2, text_box_y - 2, 
                        text_box_x + text_box_width + 2, 
                        text_box_y + text_box_height + 2, 
                        c_white, c_white, c_white, c_white, true);
    
    draw_set_alpha(1);
    
    // Имя говорящего (если есть)
    if (speaker_name != "") {
        draw_set_font(dialog_font); // Отдельный шрифт для имени
        draw_set_color(c_yellow);
        draw_text(text_box_x + 20, text_box_y + 15, speaker_name + ":");
    }
    
    // Основной текст
    draw_set_font(dialog_font);
    draw_set_color(c_white);
    
    // Текст с переносами
    var text_x = text_box_x + 20;
    var text_y = text_box_y + (speaker_name == "" ? 30 : 50);
    
    draw_text_ext(text_x, text_y, display_text, -1, text_box_width - 40);
    
    // Мигающая стрелка в конце (если текст весь показан)
    //if (current_char >= string_length(current_text) && dialog_active) {
    //    if (floor( / 30) mod 2 == 0) {
     //       draw_sprite(spr_cursor, 0, 
     //                  text_box_x + text_box_width - 30, 
     //                  text_box_y + text_box_height - 25);
    //    }
    //}
}