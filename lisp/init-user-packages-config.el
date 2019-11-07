;;show calendar at startup
(calendar)


;;set Mondy as the firstday on calendar(default is Sunday)
 (setq calendar-week-start-day 1)



;;load neotree
(require 'neotree)
(global-set-key [f3] 'neotree-toggle)



(provide 'init-user-packages-config)

