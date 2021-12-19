import React, { useRef, useState } from 'react';
import { useForm } from 'react-hook-form';

import { Modal, Form, Button, InputGroup } from 'react-bootstrap';
import './LoginModal.css';

export const LoginModal = ({ show, handleClose, handleLoginSubmit }) => {
  const loginHeaderLink = useRef(null);
  const regHeaderLink = useRef(null);
  const emailLabel = useRef(null);
  const passwordLabel = useRef(null);
  const emailRegLabel = useRef(null);
  const passwordRegLabel = useRef(null);
  const nameRegLabel = useRef(null);
  const [showForm, setShowForm] = useState('login');
  const [showPass, setShowPass] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const submit = (data) => {
    // e.preventDefault() ;
    // console.log(data);
    handleLoginSubmit();
  };

  const handleInputFocus = (ref) => {
    ref.current.className = 'login__label';
  };
  const handleInputBlur = (ref) => {
    ref.current.className = 'login__label login__label--hidden';
  };

  const headerActiveLinkClasses =
    'login__header-link  login__header-link--active';
  const headerPassiveLinkClasses = 'login__header-link';

  const handleHeaderLinkClick = (whatForm) => {
    if (whatForm === 'login') {
      loginHeaderLink.current.className = headerActiveLinkClasses;
      regHeaderLink.current.className = headerPassiveLinkClasses;
    } else {
      regHeaderLink.current.className = headerActiveLinkClasses;
      loginHeaderLink.current.className = headerPassiveLinkClasses;
    }
    setShowForm(whatForm);
  };

  const handleWindowClose = () => {
    setShowForm('login');
    handleClose();
  };

  const togglePassword = () => {
    setShowPass(!showPass);
  };

  return (
    <>
      <Modal
        show={show}
        onHide={handleWindowClose}
        className="login__container"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header className="login__header" closeButton></Modal.Header>
        <div className="login__header-links">
          <a
            ref={loginHeaderLink}
            className={headerActiveLinkClasses}
            // onClick={() => setShowForm('login')}
            onClick={() => handleHeaderLinkClick('login')}
          >
            Log in
          </a>
          <a
            ref={regHeaderLink}
            className="login__header-link"
            onClick={() => handleHeaderLinkClick('register')}
          >
            Sign up
          </a>
        </div>
        <Modal.Body className="login__modal-body">
          {showForm === 'login' && (
            <Form onSubmit={handleSubmit((data) => submit(data))}>
              <Form.Group
                className="mb-3"
                controlId="formBasicEmail"
                className="login__formgroup"
              >
                <Form.Label
                  ref={emailLabel}
                  className="login__label login__label--hidden"
                >
                  Email
                </Form.Label>
                <Form.Control
                  {...register('email', {
                    required: 'This is required',
                    minLength: { value: 2, message: 'Min length is 2' },
                  })}
                  type="email"
                  placeholder="Email"
                  className="login__input"
                  onFocus={() => handleInputFocus(emailLabel)}
                  onBlur={() => handleInputBlur(emailLabel)}
                />
                <div className="login__icon  login__icon--email"></div>
                {errors.email && (
                  <p className="login__error">{errors.email.message}</p>
                )}
              </Form.Group>

              <Form.Group
                className="mb-3"
                controlId="formBasicPassword"
                className="login__formgroup"
              >
                <Form.Label
                  ref={passwordLabel}
                  className="login__label login__label--hidden"
                >
                  Password
                </Form.Label>
                <Form.Control
                  {...register('password', {
                    required: 'This is required',
                    minLength: { value: 3, message: 'Min length is 3' },
                  })}
                  type={showPass ? 'text' : 'password'}
                  placeholder="Password"
                  className="login__input"
                  onFocus={() => handleInputFocus(passwordLabel)}
                  onBlur={() => handleInputBlur(passwordLabel)}
                />
                {!showPass && (
                  <div
                    className="login__icon  login__icon--passHidden"
                    onClick={togglePassword}
                  ></div>
                )}
                {showPass && (
                  <div
                    className="login__icon  login__icon--passVisible"
                    onClick={togglePassword}
                  ></div>
                )}

                {errors.password && (
                  <p className="login__error">{errors.password.message}</p>
                )}
              </Form.Group>
              <Button variant="primary" type="submit" className="login__btn">
                Log In
              </Button>
            </Form>
          )}
          {/* Register form*/}
          {!(showForm === 'login') && (
            <Form onSubmit={handleSubmit((data) => submit(data))}>
              <Form.Group
                className="mb-3"
                controlId="formRegName"
                className="login__formgroup"
              >
                <Form.Label
                  ref={nameRegLabel}
                  className="login__label login__label--hidden"
                >
                  Name
                </Form.Label>
                <Form.Control
                  {...register('name', {
                    required: 'This is required',
                    minLength: { value: 2, message: 'Min length is 2' },
                  })}
                  type="name"
                  placeholder="Name"
                  className="login__input"
                  onFocus={() => handleInputFocus(nameRegLabel)}
                  onBlur={() => handleInputBlur(nameRegLabel)}
                />
                <div className="login__icon  login__icon--name"></div>
                {errors.name && (
                  <p className="login__error">{errors.name.message}</p>
                )}
              </Form.Group>
              <Form.Group
                className="mb-3"
                controlId="formRegEmail"
                className="login__formgroup"
              >
                <Form.Label
                  ref={emailRegLabel}
                  className="login__label login__label--hidden"
                >
                  Email
                </Form.Label>
                <Form.Control
                  {...register('email', {
                    required: 'This is required',
                    minLength: { value: 2, message: 'Min length is 2' },
                  })}
                  type="email"
                  placeholder="Email"
                  className="login__input"
                  onFocus={() => handleInputFocus(emailRegLabel)}
                  onBlur={() => handleInputBlur(emailRegLabel)}
                />
                <div className="login__icon  login__icon--email"></div>

                {errors.email && (
                  <p className="login__error">{errors.email.message}</p>
                )}
              </Form.Group>

              <Form.Group
                className="mb-3"
                controlId="formRegPassword"
                className="login__formgroup"
              >
                <Form.Label
                  ref={passwordRegLabel}
                  className="login__label login__label--hidden"
                >
                  Password
                </Form.Label>
                <Form.Control
                  {...register('password', {
                    required: 'This is required',
                    minLength: { value: 3, message: 'Min length is 3' },
                  })}
                  type={showPass ? 'text' : 'password'}
                  placeholder="Password"
                  className="login__input"
                  onFocus={() => handleInputFocus(passwordRegLabel)}
                  onBlur={() => handleInputBlur(passwordRegLabel)}
                />
                {!showPass && (
                  <div
                    className="login__icon  login__icon--passHidden"
                    onClick={togglePassword}
                  ></div>
                )}
                {showPass && (
                  <div
                    className="login__icon  login__icon--passVisible"
                    onClick={togglePassword}
                  ></div>
                )}
                {errors.password && (
                  <p className="login__error">{errors.password.message}</p>
                )}
              </Form.Group>
              <Button variant="primary" type="submit" className="login__btn">
                Sign up
              </Button>
            </Form>
          )}
        </Modal.Body>
      </Modal>
    </>
  );
};
