#!/bin/sh
set -e

SCRIPT_DIR=$(cd "${0%/*}" && pwd)
LAB_DIR="${LAB_DIR:-$HOME/lab0}"
mkdir "$LAB_DIR"
cd "$LAB_DIR"

mkdir claude_monet archive
mkdir claude_monet/owner_office claude_monet/contracts claude_monet/advertising \
      claude_monet/kitchen claude_monet/chef_office claude_monet/hall

cat > claude_monet/owner_office/owner_order <<'EOF'
Дмитрий Нагиев требует подготовить ресторан к съёмке
Виктор Петрович должен представить новое меню
Вика отвечает за порядок в зале
EOF

cat > claude_monet/owner_office/expense_plan <<'EOF'
Новая вывеска требует согласования
Реклама ресторана оплачивается владельцем
Расходы на банкет проверить отдельно
EOF

cat > claude_monet/contracts/supplier_contract <<'EOF'
Поставщик привозит продукты утром
Шеф лично проверяет качество мяса
Оплата производится после приёмки
EOF

cat > claude_monet/contracts/concert_contract <<'EOF'
Музыканты выступают в пятницу вечером
Костя готовит напитки для артистов
Вика согласует время начала программы
EOF

cat > claude_monet/advertising/promo_plan <<'EOF'
Реклама показывает кухню и главный зал
Нагиев появляется в финале рекламного ролика
Баринов отказывается повторять текст дважды
EOF

cat > claude_monet/kitchen/chef_order <<'EOF'
Приготовить фирменное блюдо к восьми часам
Сеня и Федя отвечают за горячий цех
Лёва проверяет выдачу каждого блюда
EOF

cat > claude_monet/kitchen/menu_prices <<'EOF'
Утиная ножка 850
Луковый суп 430
Мильфей 520
Стейк от шефа 1100
EOF

cat > claude_monet/chef_office/barinov_reply <<'EOF'
Баринов согласен обновить меню
Баринов не согласен сниматься в рекламе
Все решения по кухне принимает шеф
EOF

cat > claude_monet/hall/vip_guests <<'EOF'
За первым столом сидят актёры
Для Нагиева оставить место у сцены
Постоянным гостям подать десерт от Луи
EOF

cat > nagiev_call <<'EOF'
Нагиев позвонил Вике утром
Владелец приедет после открытия
Отчёт о расходах должен быть готов
EOF

chmod 755 claude_monet
chmod u=rwx,g=rx,o= claude_monet/owner_office
chmod 640 claude_monet/owner_office/owner_order
chmod u=rw,g=r,o= claude_monet/owner_office/expense_plan
chmod 750 claude_monet/contracts
chmod u=rw,g=r,o= claude_monet/contracts/supplier_contract
chmod 640 claude_monet/contracts/concert_contract
chmod u=rwx,g=rx,o= claude_monet/advertising
chmod 644 claude_monet/advertising/promo_plan
chmod u=rwx,g=rx,o= claude_monet/kitchen
chmod 640 claude_monet/kitchen/chef_order
chmod u=rw,g=r,o=r claude_monet/kitchen/menu_prices
chmod 750 claude_monet/chef_office
chmod u=rw,g=r,o= claude_monet/chef_office/barinov_reply
chmod 755 claude_monet/hall
chmod u=rw,g=r,o=r claude_monet/hall/vip_guests
chmod u=rwx,g=rx,o= archive
chmod 640 nagiev_call

ls -lR "$LAB_DIR"
cp -R "$LAB_DIR" "$SCRIPT_DIR/lab0"
