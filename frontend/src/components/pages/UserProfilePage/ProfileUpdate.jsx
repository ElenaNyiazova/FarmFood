import React, { useState } from 'react';
import { useForm } from 'react-hook-form';

import { Row, Container, Col, Form, Button } from 'react-bootstrap';

export const ProfileUpdate = () => {
  const [showPass, setShowPass] = useState(false);

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const togglePassword = () => {
    setShowPass(!showPass);
  };

  return (
    <Row className="profile__update">
      <Form onSubmit={() => {}}>
        <Form.Group
          className="mb-3"
          controlId="formRegName"
          className="profile-form__formgroup"
        >
          <Form.Label className="profile-form__label profile-form__label--hidden">
            Name
          </Form.Label>
          <Form.Control
            {...register('name', {
              required: 'This is required',
              minLength: { value: 2, message: 'Min length is 2' },
            })}
            type="name"
            placeholder="Name"
            className="profile-form__input"
            onFocus={() => {}}
            onBlur={() => {}}
          />
          <div className="profile-form__icon  profile-form__icon--name"></div>
          {errors.name && (
            <p className="profile-form__error">{errors.name.message}</p>
          )}
        </Form.Group>
        <Form.Group
          className="mb-3"
          controlId="formRegEmail"
          className="profile-form__formgroup"
        >
          <Form.Label className="profile-form__label profile-form__label--hidden">
            Email
          </Form.Label>
          <Form.Control
            {...register('email', {
              required: 'This is required',
              minLength: { value: 2, message: 'Min length is 2' },
            })}
            type="email"
            placeholder="Email"
            className="profile-form__input"
            onFocus={() => {}}
            onBlur={() => {}}
          />
          <div className="profile-form__icon  profile-form__icon--email"></div>

          {errors.email && (
            <p className="profile-form__error">{errors.email.message}</p>
          )}
        </Form.Group>

        <Form.Group
          className="mb-3"
          controlId="formRegPassword"
          className="profile-form__formgroup"
        >
          <Form.Label className="profile-form__label profile-form__label--hidden">
            Password
          </Form.Label>
          <Form.Control
            {...register('password', {
              required: 'This is required',
              minLength: { value: 3, message: 'Min length is 3' },
            })}
            type={showPass ? 'text' : 'password'}
            placeholder="Password"
            className="profile-form__input"
            onFocus={() => {}}
            onBlur={() => {}}
          />
          {!showPass && (
            <div
              className="profile-form__icon  profile-form__icon--passHidden"
              onClick={togglePassword}
            ></div>
          )}
          {showPass && (
            <div
              className="profile-form__icon  profile-form__icon--passVisible"
              onClick={togglePassword}
            ></div>
          )}
          {errors.password && (
            <p className="profile-form__error">{errors.password.message}</p>
          )}
        </Form.Group>
        <Button variant="primary" type="submit" className="profile-form__btn">
          Update
        </Button>
      </Form>
    </Row>
  );
};
