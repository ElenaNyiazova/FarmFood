import React, { useState } from 'react';
import { PROFILE } from '../../../consts/consts';

export const ProfileMenu = ({ handleClick, handleLogOutClick }) => {
  const handleTabClick = (link) => {
    const selectedTab = document.querySelector('.profile__item--selected');
    selectedTab.classList.remove('profile__item--selected');
    link.classList.add('profile__item--selected');
    handleClick(link.innerText);
  };

  return (
    <ul className="profile__menu">
      <li
        className="profile__item  profile__item--selected"
        onClick={(e) => handleTabClick(e.target)}
      >
        {PROFILE.PROFILE}
      </li>
      <li className="profile__item" onClick={(e) => handleTabClick(e.target)}>
        {PROFILE.FOLLOW}
      </li>
      <li className="profile__item" onClick={(e) => handleTabClick(e.target)}>
        {PROFILE.WIHSLIST}
      </li>
      <li
        className="profile__item  profile__item--exit"
        onClick={handleLogOutClick}
      >
        Sign Out
      </li>
    </ul>
  );
};
