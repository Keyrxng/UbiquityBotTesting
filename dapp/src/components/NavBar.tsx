import React from 'react';
import { BaseError } from 'viem'; 
import { useAccount, useConnect, useDisconnect } from 'wagmi';

function Navbar() {
  const navbarStyle = { 
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: '#333',
    color: '#fff',
    padding: '10px 20px',
    margin-left: '20px';
  };

  const buttonStyle = {
    backgroundColor: '#555',
    color: '#fff',
    border: 'none',
    borderRadius: '5px',
    padding: '8px 12px',
    marginRight: '10px',
    cursor: 'pointer',
    background-color: '#ccc';
    margin: '5px'; 
  };

  return (
    <div style={navbarStyle}>
      <div>
        <img src="icon.png" alt="Icon" style={{ width: '40px', height: '40px' }}
      </div>
      <div>
        <button style={buttonStyle}>About</button>
        <button style={buttonStyle}>Contact</button>
        <button style={buttonStyle}>Demo</button>
        <button style={buttonStyle}>Error Button</button>
      </div>
      <div>
        <button style={buttonStyle}>Theme</button>
        <button style={buttonStyle}>Settings</button>
      </div>
    </div>
  );
}

export default Navbar;
