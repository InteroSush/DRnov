// CREATE EVENT
dialog_active = false;
current_text = "";
display_text = "";
current_char = 0;
text_speed = 2;
dialog_timer = 0;

// Настройки внешнего вида

text_box_width = display_get_gui_width() div 2;
text_box_height = display_get_gui_height() div 6;
text_box_x = (display_get_gui_width()-text_box_width) div 2;
text_box_y = display_get_gui_height() - text_box_height - 50;

// Шрифты и звуки
dialog_font = font_und; // Создайте пиксельный шрифт
text_sound = snd_text; // Создайте звук для текста
sound_timer = 0;
sount_pitch = 1;

// Персонаж говорящего
speaker_name = "";
speaker_sprite = -1;

// Анимация
box_alpha = 0;
target_alpha = 0;

// Показать одно сообщение
function show_dialog(text, speaker = "", sprite = -1, pitch = 1) {
    dialog_active = true;
    current_text = text;
    display_text = "";
    current_char = 0;
    speaker_name = speaker;
    speaker_sprite = sprite;
    target_alpha = 1;
    sount_pitch = pitch;
    
    // Приостановка игры (опционально)
    // game_set_speed(0, current_time);
}

// Очередь сообщений
queue = ds_queue_create();

function queue_dialog(text, speaker = "", sprite = -1, pitch = 1) {
    var dialog = {
        text: text,
        speaker: speaker,
        pitch: pitch,
        sprite: sprite
    };
    ds_queue_enqueue(queue, dialog);
    
    // Если диалог не активен, начать показ
    if (!dialog_active) {
        show_next_dialog();
    }
}

function show_next_dialog() {
    if (!ds_queue_empty(queue)) {
        var next_dialog = ds_queue_dequeue(queue);
        show_dialog(next_dialog.text, next_dialog.speaker, next_dialog.sprite, next_dialog.pitch);
    }
}