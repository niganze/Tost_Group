<?php 
return [
    'title' => 'Laravel安装程序',
    'next' => '下一步',
    'back' => '以前',
    'finish' => '安装',
    'forms' => [
        'errorTitle' => '发生以下错误：',
    ],
    'welcome' => [
        'templateTitle' => '欢迎',
        'title' => 'Laravel安装程序',
        'message' => '简易安装和设置向导。',
        'next' => '检查要求',
    ],
    'requirements' => [
        'templateTitle' => '步骤1 |服务器要求',
        'title' => '服务器要求',
        'next' => '检查权限',
    ],
    'permissions' => [
        'templateTitle' => '步骤2 |权限',
        'title' => '权限',
        'next' => '配置环境',
    ],
    'environment' => [
        'menu' => [
            'templateTitle' => '步骤3 |环境设定',
            'title' => '环境设定',
            'desc' => '请选择您要如何配置应用程序<code> .env </ code>文件。',
            'wizard-button' => '表单向导设置',
            'classic-button' => '经典文字编辑器',
        ],
        'wizard' => [
            'templateTitle' => '步骤3 |环境设置|向导向导',
            'title' => '引导的<code> .env </ code>向导',
            'tabs' => [
                'environment' => '环境',
                'database' => '数据库',
                'application' => '应用',
            ],
            'form' => [
                'name_required' => '必须输入环境名称。',
                'app_name_label' => '应用名称',
                'app_name_placeholder' => '应用名称',
                'app_environment_label' => '应用环境',
                'app_environment_label_local' => '本地',
                'app_environment_label_developement' => '发展历程',
                'app_environment_label_qa' => 'a',
                'app_environment_label_production' => '生产',
                'app_environment_label_other' => '其他',
                'app_environment_placeholder_other' => '输入您的环境...',
                'app_debug_label' => '应用调试',
                'app_debug_label_true' => '真正',
                'app_debug_label_false' => '假',
                'app_log_level_label' => '应用日志级别',
                'app_log_level_label_debug' => '调试',
                'app_log_level_label_info' => '信息',
                'app_log_level_label_notice' => '注意',
                'app_log_level_label_warning' => '警告',
                'app_log_level_label_error' => '错误',
                'app_log_level_label_critical' => '危急',
                'app_log_level_label_alert' => '警报',
                'app_log_level_label_emergency' => '紧急情况',
                'app_url_label' => '应用程式网址',
                'app_url_placeholder' => '应用程式网址',
                'db_connection_failed' => '无法连接到数据库。',
                'db_connection_label' => '数据库连接',
                'db_connection_label_mysql' => 'MySQL的',
                'db_connection_label_sqlite' => 'sqlite',
                'db_connection_label_pgsql' => 'pgsql',
                'db_connection_label_sqlsrv' => 'sqlsrv',
                'db_host_label' => '数据库主机',
                'db_host_placeholder' => '数据库主机',
                'db_port_label' => '数据库端口',
                'db_port_placeholder' => '数据库端口',
                'db_name_label' => '数据库名称',
                'db_name_placeholder' => '数据库名称',
                'db_username_label' => '数据库用户名',
                'db_username_placeholder' => '数据库用户名',
                'db_password_label' => '数据库密码',
                'db_password_placeholder' => '数据库密码',
                'app_tabs' => [
                    'more_info' => '更多信息',
                    'broadcasting_title' => '',
                    'broadcasting_label' => '广播驱动程序',
                    'broadcasting_placeholder' => '广播驱动程序',
                    'cache_label' => '缓存驱动程序',
                    'cache_placeholder' => '缓存驱动程序',
                    'session_label' => '会话驱动程序',
                    'session_placeholder' => '会话驱动程序',
                    'queue_label' => '队列驱动程序',
                    'queue_placeholder' => '队列驱动程序',
                    'redis_label' => 'Redis驱动',
                    'redis_host' => 'Redis主机',
                    'redis_password' => 'Redis密码',
                    'redis_port' => '雷迪斯港口',
                    'mail_label' => '邮件',
                    'mail_driver_label' => '邮件驱动',
                    'mail_driver_placeholder' => '邮件驱动',
                    'mail_host_label' => '邮件主机',
                    'mail_host_placeholder' => '邮件主机',
                    'mail_port_label' => '邮件端口',
                    'mail_port_placeholder' => '邮件端口',
                    'mail_username_label' => '邮件用户名',
                    'mail_username_placeholder' => '邮件用户名',
                    'mail_password_label' => '邮件密码',
                    'mail_password_placeholder' => '邮件密码',
                    'mail_encryption_label' => '邮件加密',
                    'mail_encryption_placeholder' => '邮件加密',
                    'pusher_label' => '推杆',
                    'pusher_app_id_label' => '推送器应用ID',
                    'pusher_app_id_palceholder' => '推送器应用ID',
                    'pusher_app_key_label' => '推送器应用程序密钥',
                    'pusher_app_key_palceholder' => '推送器应用程序密钥',
                    'pusher_app_secret_label' => 'Pusher App Secret',
                    'pusher_app_secret_palceholder' => 'Pusher App Secret',
                ],
                'buttons' => [
                    'setup_database' => '设置数据库',
                    'setup_application' => '设置应用',
                    'install' => '安装',
                ],
            ],
        ],
        'classic' => [
            'templateTitle' => '步骤3 |环境设置|经典编辑器',
            'title' => '经典环境编辑器',
            'save' => '保存.env',
            'back' => '使用表单向导',
            'install' => '保存并安装',
        ],
        'success' => '您的.env文件设置已保存。',
        'errors' => '.env文件无法保存，请手动创建。',
    ],
    'install' => '安装',
    'installed' => [
        'success_log_message' => 'Laravel安装程序已成功安装',
    ],
    'final' => [
        'title' => '安装完成',
        'templateTitle' => '安装完成',
        'finished' => '应用程序已成功安装。',
        'migration' => '',
        'console' => '应用程序控制台输出：',
        'log' => '安装日志条目：',
        'env' => '最终的.env文件：',
        'exit' => '点击此处退出',
    ],
    'updater' => [
        'title' => 'Laravel更新器',
        'welcome' => [
            'title' => '欢迎使用更新程序',
            'message' => '欢迎使用更新向导。',
        ],
        'overview' => [
            'title' => '总览',
            'message' => '有1个更新。|有：number个更新。',
            'install_updates' => '安装更新',
        ],
        'final' => [
            'title' => '已完成',
            'finished' => '应用程序的数据库已成功更新。',
            'exit' => '点击此处退出',
        ],
        'log' => [
            'success_message' => 'Laravel安装程序已成功更新',
        ],
    ],
];