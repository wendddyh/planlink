// BottomDrawer.js
import React, { useState } from 'react';

const BottomDrawer = () => {
  const [isOpen, setIsOpen] = useState(false);

  const toggleDrawer = () => {
    setIsOpen(!isOpen);
  };

  return (
    <div className={`bottom-drawer ${isOpen ? 'open' : ''}`}>
      <button onClick={toggleDrawer}>Toggle Drawer</button>
      {/* Content of the drawer */}
    </div>
  );
};

export default BottomDrawer;
