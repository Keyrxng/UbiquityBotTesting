import { defineConfig } from '@wagmi/cli'
import { foundry, react } from '@wagmi/cli/plugins'
import * as chains from 'wagmi/chains'

export default defineConfig({
  out: 'src/generated.ts',
  plugins: [
    foundry({
      deployments: {
        Counter: {
          [chains.mainnet.id]: '0x1A61839Eb5fC6eBBcAe01eD5E79062E598792Dac',
        },
      },
      project: './contracts',
    }),
    react(),
  ],
})
