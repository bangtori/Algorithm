# 입력 받기
n, m, k = map(int, input().split())

# 방향 설정 (상, 우상, 우, 우하, 하, 좌하, 좌, 좌상)
directions = [(-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1), (-1, -1)]

# 파이어볼 초기 설정
fireballs = []
for _ in range(m):
    r, c, mi, si, di = map(int, input().split())
    fireballs.append([r - 1, c - 1, mi, si, di])

def move_fireballs(fireballs):
    new_positions = {}
    for r, c, mi, si, di in fireballs:
        # 새로운 위치 계산
        dr, dc = directions[di]
        new_r = (r + dr * si) % n
        new_c = (c + dc * si) % n
        
        if (new_r, new_c) not in new_positions:
            new_positions[(new_r, new_c)] = []
        
        new_positions[(new_r, new_c)].append([new_r, new_c, mi, si, di])
    
    return new_positions

def process_collisions(new_positions):
    new_fireballs = []
    for (r, c), fireballs in new_positions.items():
        if len(fireballs) == 1:
            new_fireballs.append(fireballs[0])
        else:
            # 파이어볼 합체 처리
            total_m = sum([fb[2] for fb in fireballs])
            total_s = sum([fb[3] for fb in fireballs])
            count = len(fireballs)
            new_m = total_m // 5
            if new_m > 0:
                new_s = total_s // count
                # 홀수 혹은 짝수 방향 결정
                is_all_even = all(fb[4] % 2 == 0 for fb in fireballs)
                is_all_odd = all(fb[4] % 2 == 1 for fb in fireballs)
                new_directions = [0, 2, 4, 6] if is_all_even or is_all_odd else [1, 3, 5, 7]
                for new_d in new_directions:
                    new_fireballs.append([r, c, new_m, new_s, new_d])
    return new_fireballs

# 시뮬레이션 진행
for _ in range(k):
    new_positions = move_fireballs(fireballs)
    fireballs = process_collisions(new_positions)

# 결과 계산
total_mass = sum([fb[2] for fb in fireballs])
print(total_mass)