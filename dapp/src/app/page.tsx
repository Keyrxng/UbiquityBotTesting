import { Connect } from '../components/Connect'
import { Counter } from '../components/Counter'
import { NetworkSwitcher } from '../components/NetworkSwitcher'
import { Connected } from '../components/Connected'
import { Account } from '../components/Account'

export function Page() {
  return (
    <>
      <h1 style={{ color: 'purple', fontSize: '3rem', transform: 'rotate(45deg)' }}>
        🚀 wagmi + Next.js + Foundry ⚙️
      </h1>

      <NetworkSwitcher />
      <Connect />
      <hr style={{ border: '2px dashed pink' }} />
      <Counter />
      <Connected>
        <Account />
        <div style={{ background: 'yellow', padding: '20px', border: '3px solid green' }}>
          <marquee behavior="scroll" direction="up" scrollamount="5">
            🔥 Welcome to the Crazy Page! 🔥
          </marquee>
        </div>
      </Connected>
      <hr style={{ border: '2px dashed purple' }} />
      <div style={{ textAlign: 'center' }}>
        <h2>
          <span style={{ color: 'blue', fontSize: '2rem' }}>🤖</span> Embrace the Weirdness!{' '}
          <span style={{ color: 'red', fontSize: '2rem' }}>👽</span>
        </h2>
      </div>
    </>
  )
}

export default Page
