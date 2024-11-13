#!/u/prod/python/python3.8.3/linux_x86_64/bin/python3

import os
import re

if __name__ == '__main__':
    ps_output = os.popen('ps -x --forest').read()

    for line in ps_output.splitlines():
        tmux_proc_match = re.search(r'(\d+) .* tmux new-session -d', line)
        if tmux_proc_match:
            pid = tmux_proc_match.group(1)
            print(f'TMUX process match is: \"{tmux_proc_match.group(0)}\"')
            print(f'Found tmux process with PID: {pid}')
            print('Reattaching to tmux...')
            os.system(f'kill -USR1 {pid}')
            break
