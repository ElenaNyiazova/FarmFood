import React, { useRef, useState } from 'react';
import { useForm } from 'react-hook-form';

import { Modal, Form, Button } from 'react-bootstrap';
import './LoginModal.css';

export const LoginModal = ({ show, handleClose, handleLoginSubmit }) => {
  const emailLabel = useRef(null);
  const passwordLabel = useRef(null);
  const emailRegLabel = useRef(null);
  const passwordRegLabel = useRef(null);
  const nameRegLabel = useRef(null);
  const [showForm, setShowForm] = useState('login');

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

  const handleEmailFocus = (ref) => {
    ref.current.className = 'login__label';
  };
  const handleEmailBlur = (ref) => {
    ref.current.className = 'login__label login__label--hidden';
  };

  return (
    <>
      <Modal
        show={show}
        onHide={handleClose}
        className="login__container"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header className="login__header" closeButton></Modal.Header>
        <div className="login__header-links">
          <a
            className="login__header-link"
            onClick={() => setShowForm('login')}
          >
            Log in
          </a>
          <a
            className="login__header-link"
            onClick={() => setShowForm('register')}
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
                  onFocus={() => handleEmailFocus(emailLabel)}
                  onBlur={() => handleEmailBlur(emailLabel)}
                />
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
                  type="password"
                  placeholder="Password"
                  className="login__input"
                  onFocus={() => handleEmailFocus(passwordLabel)}
                  onBlur={() => handleEmailBlur(passwordLabel)}
                />
              </Form.Group>
              {errors.password && (
                <p className="login__error">{errors.password.message}</p>
              )}
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
                  onFocus={() => handleEmailFocus(nameRegLabel)}
                  onBlur={() => handleEmailBlur(nameRegLabel)}
                />
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
                  onFocus={() => handleEmailFocus(emailLabel)}
                  onBlur={() => handleEmailBlur(emailLabel)}
                />
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
                  type="password"
                  placeholder="Password"
                  className="login__input"
                  onFocus={() => handleEmailFocus(passwordLabel)}
                  onBlur={() => handleEmailBlur(passwordLabel)}
                />
              </Form.Group>
              {errors.password && (
                <p className="login__error">{errors.password.message}</p>
              )}
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
