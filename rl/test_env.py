import gymnasium as gym
import gymnasium_robotics

env = gym.make("FetchPickAndPlaceDense-v2", render_mode="human", max_episode_steps=100)

# Figure out the observation and action space
print("Observation space:", env.observation_space)
print("Action space:", env.action_space)

# Render in loop
n_episodes = 10
for episode in range(n_episodes):
    obs, info = env.reset()
    done = False
    while not done:
        action = env.action_space.sample()  # Random action
        obs, reward, terminated, truncated, info = env.step(action)
        env.render()
        done = terminated or truncated
    print(f"Episode {episode + 1} finished.")
env.close()