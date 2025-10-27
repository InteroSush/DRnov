// STEP EVENT
// Плавное появление/исчезание окна
box_alpha = lerp(box_alpha, target_alpha, 0.2);

if (dialog_active) {
    // Постепенное появление текста
    dialog_timer++;
    if (dialog_timer >= text_speed) {
        dialog_timer = 0;
        
        if (current_char < string_length(current_text)) {
            current_char++;
            display_text = string_copy(current_text, 1, current_char);
            
            // Звук набора текста (каждый N-ый символ)
            sound_timer++;
            if (sound_timer >= 2 && string_char_at(current_text, current_char) != " ") {
                audio_play_sound(text_sound, 1, false, 1, 0, random_range(sount_pitch-0.1, sount_pitch+0.1));
                sound_timer = 0;
            }
        }
    }
    
    // Пропуск текста при нажатии Z
    if (keyboard_check_pressed(ord("Z"))) {
        if (current_char < string_length(current_text)) {
            // Показать весь текст сразу
            current_char = string_length(current_text);
            display_text = current_text;
        } else {
            // Следующая реплика или закрытие
            dialog_active = false;
            target_alpha = 0;
            
            // Проверяем, есть ли следующее сообщение
            if (!ds_queue_empty(queue)) {
                show_next_dialog();
            }
        }
    }
}